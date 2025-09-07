package server

import (
	"net/http"

	"github.com/gorilla/mux"

	"github.com/ACM-Chapter-Cusco/capibara/src/service/database"
	"github.com/ACM-Chapter-Cusco/capibara/src/tracer"
)

var log = tracer.Logger()

type Server struct {
	Handler         http.Handler
	DatabaseService database.Service
}

func NewServer(databaseService database.Service) *Server {
	s := &Server{
		DatabaseService: databaseService,
	}
	s.Handler = s.buildHandler()
	return s
}

func (s *Server) buildHandler() http.Handler {
	router := mux.NewRouter()

	router.HandleFunc("/members", s.listMembers).Methods(http.MethodGet)
	router.HandleFunc("/members/{id}", s.getMember).Methods(http.MethodGet)

	return router
}