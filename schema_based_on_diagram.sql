CREATE TABLE patients(
    id SERIAL,
    name VARCHAR(100),
    date_of_birth DATE,
    PRIMARY KEY (id)
);

CREATE TABLE treatments(
    id SERIAL,
    type VARCHAR(100),
    name VARCHAR(100),
    PRIMARY KEY (id)
);

CREATE TABLE medical_histories(
    id SERIAL,
    admitted_at TIMESTAMP,
    patient_id INT,
    status VARCHAR(100),
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES treatments(id),
    FOREIGN KEY (patient_id) REFERENCES patients(id)
);

CREATE TABLE invoices(
    id SERIAL,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)
);

CREATE TABLE invoice_items(
    id SERIAL,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id INT,
    treatment_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (invoice_id) REFERENCES invoices(id),
    FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);


/* Join table for medical_histories(id) & treatments(id) */
CREATE TABLE medical_history_treatments (
    medical_history_id INT,
    treatment_id INT,
    PRIMARY KEY (medical_history_id, treatment_id),
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id),
    FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);
