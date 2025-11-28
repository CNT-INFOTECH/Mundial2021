# Use the Ant image from the private ECR repository as the build stage
FROM 861972922519.dkr.ecr.us-east-1.amazonaws.com/cnt-infotech/ant:latest AS builder

# Set working directory
WORKDIR /app

# Copy source code
COPY . .

# Create WAR file directly from web directory
RUN mkdir -p dist && \
    cd web && \
    jar -cf ../dist/ASPAFIKO.war *

# Runtime stage
FROM 861972922519.dkr.ecr.us-east-1.amazonaws.com/cnt-infotech/tomcat:9.0-jdk8

# Remove default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the built WAR file from builder stage
COPY --from=builder /app/dist/ASPAFIKO.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
