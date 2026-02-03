// drizzle.config.ts
import { defineConfig } from "drizzle-kit";

export default defineConfig({
  dialect: "postgresql",
  // path to create_data
  schema: "./src/create_tables.ts",
  out: "./drizzle",
  dbCredentials: {
    url: "postgresql://postgres:mysecretpassword@localhost:5432/my_database"
  }
});