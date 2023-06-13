CREATE TABLE patients(
	id SERIAL PRIMARY KEY,
	name VARCHAR(100),
	date_of_birth DATE
);

CREATE TABLE treatments(
	id SERIAL PRIMARY KEY,
	type VARCHAR(100),
	name VARCHAR(100)
);

CREATE TABLE medical_histories(
	id SERIAL PRIMARY KEY REFERENCES treatments(id),
	admitted_at TIMESTAMP,
	patient_id INT REFERENCES patients(id),
	status VARCHAR(100),
	UNIQUE (id)
);

CREATE TABLE invoices(
	id SERIAL PRIMARY KEY,
	total_amount DECIMAL,
	generated_at TIMESTAMP,
	payed_at TIMESTAMP,
	medical_history_id INT UNIQUE REFERENCES medical_histories(id)
);

CREATE TABLE invoice_items(
	id SERIAL PRIMARY KEY,
	unit_price DECIMAL,
	quantity INT,
	total_price DECIMAL,
	invoice_id INT REFERENCES invoices(id),
	treatment_id INT REFERENCES treatments(id)
);
