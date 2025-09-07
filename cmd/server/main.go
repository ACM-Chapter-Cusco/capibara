package main

import (
    "database/sql"
    "encoding/json"
    "fmt"
    "net/http"

    _ "github.com/go-sql-driver/mysql"
    "github.com/ACM-Chapter-Cusco/capibara/src/config"
    "github.com/ACM-Chapter-Cusco/capibara/src/model"
    "github.com/ACM-Chapter-Cusco/capibara/src/tracer"
)

var log = tracer.Logger();

func getDBConnection(cfg *config.Config) (*sql.DB, error) {
    dsn := cfg.GetStringDbConnection()

    db, err := sql.Open(cfg.Database.Driver, dsn)
    if err != nil {
        return nil, err
    }

    if err := db.Ping(); err != nil {
        return nil, fmt.Errorf("cannot connect to database: %v", err)
    }

    log.Infof("Connected to database successfully!")
    return db, nil
}

func getAllMembers(db *sql.DB) ([]model.Member, error) {
    query := `SELECT m.id, m.username, m.github_username, m.password, m.student_id, m.role_id, m.active,
              COALESCE(s.id, 0), COALESCE(s.student_code, ''), COALESCE(s.first_names, ''),
              COALESCE(s.paternal_surname, ''), COALESCE(s.maternal_surname, ''),
              COALESCE(s.email, ''), COALESCE(s.phone_number, ''), COALESCE(s.active, false),
              COALESCE(r.id, 0), COALESCE(r.name, ''), COALESCE(r.active, false)
              FROM members m
              LEFT JOIN students s ON m.student_id = s.id
              LEFT JOIN roles r ON m.role_id = r.id
              WHERE m.active = TRUE`

    rows, err := db.Query(query)
    if err != nil {
        return nil, err
    }
    defer rows.Close()

    var members []model.Member
    for rows.Next() {
        var member model.Member
        var studentData model.Student
        var roleData model.Role

        if err := rows.Scan(&member.ID, &member.Username, &member.GithubUsername, &member.Password,
                           &member.StudentID, &member.RoleID, &member.Active,
                           &studentData.ID, &studentData.StudentCode, &studentData.FirstNames,
                           &studentData.PaternalSurname, &studentData.MaternalSurname,
                           &studentData.Email, &studentData.PhoneNumber, &studentData.Active,
                           &roleData.ID, &roleData.Name, &roleData.Active); err != nil {
            log.Infof("Scan error:", err)
            continue
        }

        member.Student = &studentData
        member.Role = &roleData
        members = append(members, member)
    }

    return members, nil
}

func membersHandler(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        members, err := getAllMembers(db)
        if err != nil {
            http.Error(w, "Failed to query database", http.StatusInternalServerError)
            log.Infof("Query error:", err)
            return
        }

        w.Header().Set("Content-Type", "application/json")
        json.NewEncoder(w).Encode(members)
    }
}

func main() {
    cfg := config.NewConfiguration()

    db, err := getDBConnection(cfg)
    if err != nil {
        log.Fatal(err)
    }
    defer db.Close()

    http.HandleFunc("/members", membersHandler(db))

    serverHost := fmt.Sprintf(":%s", cfg.Server.Port)
    log.Infof("Starting server on %s", serverHost)
    log.Fatal(http.ListenAndServe(serverHost, nil))
}
