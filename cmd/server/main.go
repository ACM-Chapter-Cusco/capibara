package main

import (
    "database/sql"
    "encoding/json"
    "fmt"
    "log"
    "net/http"
    "os"

    _ "github.com/go-sql-driver/mysql"
)

type Person struct {
    ID        int    `json:"id"`
    Name      string `json:"name"`
    Age       int    `json:"age"`
    Email     string `json:"email"`
    City      string `json:"city"`
    IsActive  bool   `json:"is_active"`
    CreatedAt string `json:"created_at"`
}

func getDBConnection() (*sql.DB, error) {
    dbUser := os.Getenv("DB_USER")
    dbPassword := os.Getenv("DB_PASSWORD")
    dbName := os.Getenv("DB_NAME")
    connectionName := os.Getenv("DB_CONNECTION")

    if dbUser == "" || dbPassword == "" || dbName == "" || connectionName == "" {
        return nil, fmt.Errorf("database credentials not set in environment variables")
    }

    // Use if you are running in GCP
    dsn := fmt.Sprintf("%s:%s@unix(/cloudsql/%s)/%s", dbUser, dbPassword, connectionName, dbName)

    // Use if you are running localhost
    //dsn := fmt.Sprintf("%s:%s@tcp(%s)/%s", dbUser, dbPassword, "localhost:3306", dbName)

    db, err := sql.Open("mysql", dsn)
    if err != nil {
        return nil, err
    }

    if err := db.Ping(); err != nil {
        return nil, fmt.Errorf("cannot connect to database: %v", err)
    }

    log.Println("Connected to Cloud SQL successfully!")
    return db, nil
}

func getAllPersons(db *sql.DB) ([]Person, error) {
    rows, err := db.Query("SELECT id, name, age, email, city, is_active, created_at FROM person")
    if err != nil {
        return nil, err
    }
    defer rows.Close()

    var people []Person
    for rows.Next() {
        var p Person
        if err := rows.Scan(&p.ID, &p.Name, &p.Age, &p.Email, &p.City, &p.IsActive, &p.CreatedAt); err != nil {
            log.Println("Scan error:", err)
            continue
        }
        people = append(people, p)
    }

    return people, nil
}

func usersHandler(db *sql.DB) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        people, err := getAllPersons(db)
        if err != nil {
            http.Error(w, "Failed to query database", http.StatusInternalServerError)
            log.Println("Query error:", err)
            return
        }

        w.Header().Set("Content-Type", "application/json")
        json.NewEncoder(w).Encode(people)
    }
}

func main() {
    db, err := getDBConnection()
    if err != nil {
        log.Fatal(err)
    }
    defer db.Close()

    http.HandleFunc("/users", usersHandler(db))

    log.Println("Starting server on :8080")
    log.Fatal(http.ListenAndServe(":8080", nil))
}
