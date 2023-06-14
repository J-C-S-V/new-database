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

/* Index for each foreign key */
CREATE INDEX idx_medical_histories_id ON medical_histories (id);
CREATE INDEX idx_medical_histories_patient_id ON medical_histories (patient_id);
CREATE INDEX idx_invoices_medical_history_id ON invoices (medical_history_id);
CREATE INDEX idx_invoice_items_invoice_id ON invoice_items (invoice_id);
CREATE INDEX idx_invoice_items_treatment_id ON invoice_items (treatment_id);
CREATE INDEX idx_medical_history_treatments_medical_history_id ON medical_history_treatments (medical_history_id);
CREATE INDEX idx_medical_history_treatments_treatment_id ON medical_history_treatments (treatment_id);