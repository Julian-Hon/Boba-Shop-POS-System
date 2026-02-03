CREATE TABLE "beverage" (
	"beverage_id" serial PRIMARY KEY NOT NULL,
	"order_id" integer NOT NULL,
	"beverage_info_id" integer NOT NULL,
	"beverage_name" text NOT NULL,
	"quantity" integer DEFAULT 0 NOT NULL,
	"ice_level" text NOT NULL,
	"sweetness_level" text NOT NULL,
	"size" text NOT NULL,
	"price" real DEFAULT 0 NOT NULL
);
--> statement-breakpoint
CREATE TABLE "beverage_info" (
	"beverage_info_id" serial PRIMARY KEY NOT NULL,
	"category" text NOT NULL,
	"name" text NOT NULL,
	"price" real DEFAULT 0 NOT NULL
);
--> statement-breakpoint
CREATE TABLE "beverage_toppings" (
	"beverage_topping_id" serial PRIMARY KEY NOT NULL,
	"beverage_id" integer NOT NULL,
	"topping_id" integer NOT NULL,
	"topping_name" text NOT NULL,
	"action" text NOT NULL
);
--> statement-breakpoint
CREATE TABLE "customer" (
	"customer_id" serial PRIMARY KEY NOT NULL,
	"first_name" text NOT NULL,
	"last_name" text NOT NULL,
	"email" text NOT NULL,
	"phone" text NOT NULL
);
--> statement-breakpoint
CREATE TABLE "inventory" (
	"inventory_id" serial PRIMARY KEY NOT NULL,
	"name" text NOT NULL,
	"stock_level" integer DEFAULT 0 NOT NULL
);
--> statement-breakpoint
CREATE TABLE "menu_inventory" (
	"beverage_info_id" integer NOT NULL,
	"inventory_id" integer NOT NULL,
	"qt" integer DEFAULT 0 NOT NULL,
	"unit" text NOT NULL
);
--> statement-breakpoint
CREATE TABLE "order" (
	"order_id" serial PRIMARY KEY NOT NULL,
	"customer_id" integer NOT NULL,
	"total_price" real DEFAULT 0 NOT NULL,
	"month" integer DEFAULT 0 NOT NULL,
	"week" integer DEFAULT 0 NOT NULL,
	"date" integer DEFAULT 0 NOT NULL,
	"hour" integer DEFAULT 0 NOT NULL,
	"year" integer DEFAULT 0 NOT NULL,
	"combine_date" timestamp NOT NULL
);
--> statement-breakpoint
CREATE TABLE "toppings" (
	"topping_id" serial PRIMARY KEY NOT NULL,
	"name" text NOT NULL,
	"price" real NOT NULL,
	"inventory_id" integer NOT NULL
);

CREATE TABLE "menu_inventory" (
	"beverage_info_id" serial NOT NULL,
	"inventory_id" serial NOT NULL,
	"qt" real NOT NULL,
	"unit" text NOT NULL
);

CREATE TABLE "inventory_table" (
	"inventory_id" serial PRIMARY KEY NOT NULL,
	"name" text NOT NULL,
	"stock_level" real NOT NULL
);

CREATE TABLE "employee" (
	"employee_id" serial PRIMARY KEY NOT NULL,
	"first_name" text NOT NULL,
	"last_name" text NOT NULL
);

CREATE TABLE "employee" (
	"employee_id" serial PRIMARY KEY NOT NULL,
	"first_name" text NOT NULL,
	"last_name" text NOT NULL
);

CREATE TABLE if NOT EXISTS daily_total (
	"daily_sales" numeric(12,2) NOT NULL DEFAULT 0,
	"daily_tax" numeric(12,2) NOT NULL DEFAULT 0,
	"new_customers" integer NOT NULL DEFAULT 0,
	"order_total" integer NOT NULL DEFAULT 0,
	"customer_total" integer NOT NULL DEFAULT 0,
	"last_z_report" TIMESTAMP NULL
);

--> statement-breakpoint
ALTER TABLE "beverage" ADD CONSTRAINT "beverage_order_id_order_order_id_fk" FOREIGN KEY ("order_id") REFERENCES "public"."order"("order_id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "beverage" ADD CONSTRAINT "beverage_beverage_info_id_beverage_info_beverage_info_id_fk" FOREIGN KEY ("beverage_info_id") REFERENCES "public"."beverage_info"("beverage_info_id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "beverage_toppings" ADD CONSTRAINT "beverage_toppings_beverage_id_beverage_beverage_id_fk" FOREIGN KEY ("beverage_id") REFERENCES "public"."beverage"("beverage_id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "beverage_toppings" ADD CONSTRAINT "beverage_toppings_topping_id_toppings_topping_id_fk" FOREIGN KEY ("topping_id") REFERENCES "public"."toppings"("topping_id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "menu_inventory" ADD CONSTRAINT "menu_inventory_beverage_info_id_beverage_info_beverage_info_id_fk" FOREIGN KEY ("beverage_info_id") REFERENCES "public"."beverage_info"("beverage_info_id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "menu_inventory" ADD CONSTRAINT "menu_inventory_inventory_id_inventory_inventory_id_fk" FOREIGN KEY ("inventory_id") REFERENCES "public"."inventory"("inventory_id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "order" ADD CONSTRAINT "order_customer_id_customer_customer_id_fk" FOREIGN KEY ("customer_id") REFERENCES "public"."customer"("customer_id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "toppings" ADD CONSTRAINT "toppings_inventory_id_inventory_inventory_id_fk" FOREIGN KEY ("inventory_id") REFERENCES "public"."inventory"("inventory_id") ON DELETE no action ON UPDATE no action;
