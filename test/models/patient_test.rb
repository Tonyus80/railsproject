require "test_helper"

class PatientTest < ActiveSupport::TestCase
  test "should create new profile" do
    patient = Patient.new
    assert_not patient.save
  end

  test "should create valid patient" do
    patient = Patient.new(name_surname: "tony", gender: "M", age: "64",  address: "test street",pps: "12334DSF", medical_card: "yes", )
    assert_not patient.valid?
  end

  test "invalid patient missing  medical_card: " do
    patient = Patient.new(name_surname: "tony", gender: "M", age: "64",  address: "test street",pps: "12334DSF")
    assert_not patient.valid?
  end

  test "invalid patient missing  address: " do
    patient = Patient.new(name_surname: "tony", gender: "M", age: "64", pps: "12334DSF", medical_card: "yes", )
    assert_not patient.valid?
  end

  test "invalid patient missing  pps: " do
    patient = Patient.new(name_surname: "tony", gender: "M", age: "64",  address: "test street", medical_card: "yes", )
    assert_not patient.valid?
  end

  test "invalid patient missing  age: " do
    patient = Patient.new(name_surname: "tony", gender: "M", address: "test street", medical_card: "yes", )
    assert_not patient.valid?
  end

  test "invalid patient missing gender: " do
    patient = Patient.new(name_surname: "tony", gender: "M", address: "test street", medical_card: "yes", )
    assert_not patient.valid?
  end

  test "invalid patient missing name_surname: " do
    patient = Patient.new(gender: "M", address: "test street", medical_card: "yes", )
    assert_not patient.valid?
  end

end
