package server

import (
	"encoding/json"
	"net/http"

	"github.com/gorilla/mux"
)

func (s *Server) listMembers(w http.ResponseWriter, r *http.Request) {
	members, err := s.DatabaseService.ListMembers()
	if err != nil {
		log.Debugf("%s %s request failed: %s", r.Method, r.URL.Path, err)
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}

	response, err := json.Marshal(members)
	if err != nil {
		log.Debugf("%s %s request failed: %s", r.Method, r.URL.Path, err)
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}

	w.WriteHeader(http.StatusOK)
	w.Header().Set("Content-Type", "application/json")
	w.Write(response)
}

func (s *Server) getMember(w http.ResponseWriter, r *http.Request) {
	id := mux.Vars(r)["id"]

	member, err := s.DatabaseService.GetMember(id)
	if err != nil {
		log.Debugf("%s %s request failed: %s", r.Method, r.URL.Path, err)
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}

	response, err := json.Marshal(member)
	if err != nil {
		log.Debugf("%s %s request failed: %s", r.Method, r.URL.Path, err)
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)
	w.Write(response)
}


