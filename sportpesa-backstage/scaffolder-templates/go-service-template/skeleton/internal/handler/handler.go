package handler

import (
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
	"${{ values.name }}/internal/config"
)

func RegisterRoutes(r *gin.Engine, cfg *config.Config) {
	r.GET("/healthz", healthCheck(cfg))
	r.GET("/readyz", readyCheck())

	v1 := r.Group("/api/v1")
	{
		v1.GET("/ping", ping())
		// TODO: add your service routes here
	}
}

func healthCheck(cfg *config.Config) gin.HandlerFunc {
	return func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"status":  "healthy",
			"service": cfg.AppName,
			"env":     cfg.Env,
			"time":    time.Now().UTC(),
		})
	}
}

func readyCheck() gin.HandlerFunc {
	return func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"status": "ready",
		})
	}
}

func ping() gin.HandlerFunc {
	return func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"message": "pong",
		})
	}
}
