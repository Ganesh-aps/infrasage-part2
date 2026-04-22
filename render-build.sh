#!/bin/bash
# Render Build Script - InfraSage

# 1. Build the backend
echo "[BUILD] Building backend JAR (Spring Boot)..."
cd backend
mvn clean package -DskipTests
cd ..

# 2. Build the frontend (optional, since Vercel handles this)
# If you wanted a single-server deployment on Render, 
# you'd copy frontend dist into backend/src/main/resources/static here.

echo "[BUILD] Done. Ready to start."
