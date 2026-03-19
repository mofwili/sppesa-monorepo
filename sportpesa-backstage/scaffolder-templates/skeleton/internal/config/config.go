package config

import (
	"os"
)

type Config struct {
	Port    string
	Env     string
	GinMode string
	AppName string
}

func Load() *Config {
	env := getEnv("APP_ENV", "development")
	ginMode := "debug"
	if env == "production" {
		ginMode = "release"
	}

	return &Config{
		Port:    getEnv("PORT", "${{ values.port }}"),
		Env:     env,
		GinMode: ginMode,
		AppName: "${{ values.name }}",
	}
}

func getEnv(key, fallback string) string {
	if v := os.Getenv(key); v != "" {
		return v
	}
	return fallback
}
