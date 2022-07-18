require "test_helper"

class PatientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
    @patient = patients(:one)
  end

  test "should get index" do
    get patients_url
    assert_response :success
  end

  test "should get new" do
    get new_patient_url
    assert_response :success
  end

  test "should create patient" do
    assert_difference('Patient.count', 1) do
      #post patients_url, params: { patient: { address: @patient.address, age: @patient.age, gender: @patient.gender, medical_card: @patient.medical_card, name_surname: @patient.name_surname, pps: @patient.pps, user_id: @patient.user_id } }
      post patients_url, params: { patient: { address: @patient.address, age: @patient.age, gender: @patient.gender, medical_card: @patient.medical_card, name_surname: @patient.name_surname, pps: @patient.pps, user_id: @patient.user_id } }
    end
    assert_redirected_to patient_url(Patient.last)
  end

  test "should show patient" do
    get patient_url(@patient)
    assert_response :success
  end

  test "should get edit" do
    get edit_patient_url(@patient)
    assert_response :success
  end

  test "should update patient" do
    patch patient_url(@patient), params: { patient: { address: @patient.address, age: @patient.age, gender: @patient.gender, medical_card: @patient.medical_card, name_surname: @patient.name_surname, pps: @patient.pps, user_id: @patient.user_id  } }

    assert_redirected_to patient_url(@patient)
  end

  test "should destroy patient" do
    assert_difference('Patient.count', -1) do
      delete patient_url(@patient)
    end

    assert_redirected_to patients_url
  end
end
