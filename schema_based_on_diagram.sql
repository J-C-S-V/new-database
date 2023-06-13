CREATE TABLE patients(
	id SERIAL PRIMARY KEY,
	name VARCHAR(100),
	date_of_birth DATE
);

CREATE TABLE medical_histories(
	id SERIAL PRIMARY KEY,
	admitted_at TIMESTAMP,
	patient_id INT REFERENCES patients(id),
	status VARCHAR(100)
);
