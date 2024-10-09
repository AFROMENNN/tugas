package main

import (
	"fmt"
	"log"
	"net/http"

	routes "go-web-template/server"
	"go-web-template/server/configs"
	"go-web-template/server/database"
)

func main() {
	cfg, err := configs.LoadConfig()
	if err != nil {
		log.Fatalf("Error loading configuration: %v", err)
	}

	databaseURL := "postgresql://postgres:dINNoknVvIuhoXRskMHIDlMXVDSVZeJs@junction.proxy.rlwy.net:45423/railway"

	db, err := database.NewConnection(databaseURL)
	if err != nil {
		fmt.Printf("Failed to connect to the database: %v\n", err)
		return
	}
	defer db.Close()
	router := routes.NewRouter(db)

	port := cfg.Server.Port

	log.Printf("Starting server on port %s", port)
	if err := http.ListenAndServe(port, router); err != nil {
		log.Fatalf("Failed to start server: %v", err)
	}
}
