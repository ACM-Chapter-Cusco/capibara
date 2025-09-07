package main

import (
	"fmt"
	"net/http"

	"github.com/gorilla/handlers"

	"github.com/ACM-Chapter-Cusco/capibara/src/config"
	"github.com/ACM-Chapter-Cusco/capibara/src/connection"
	"github.com/ACM-Chapter-Cusco/capibara/src/server"
	"github.com/ACM-Chapter-Cusco/capibara/src/service/database"
	"github.com/ACM-Chapter-Cusco/capibara/src/tracer"
)

var log = tracer.Logger()

func main() {
    headers := handlers.AllowedHeaders([]string{"X-Requested-With", "Content-Type", "Authorization"})
	methods := handlers.AllowedMethods([]string{"GET", "POST", "PUT", "DELETE"})
	origins := handlers.AllowedOrigins([]string{"*"})

    cfg := config.NewConfiguration()

    conn, err := connection.NewConnection(cfg)
    if err != nil {
        log.Fatal(err)
    }
    defer conn.Close()

    dbService := database.NewService(conn)
    srv := server.NewServer(dbService)

    serverHost := fmt.Sprintf(":%s", cfg.Server.Port)
    log.Infof("Starting server on %s", serverHost)
    log.Fatal(http.ListenAndServe(serverHost, handlers.CORS(headers, methods, origins)(srv.Handler)))
}
