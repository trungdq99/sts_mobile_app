import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              CircleAvatar(
                child: Icon(Icons.person),
              ),
              Text('Tony Staff'),
              SizedBox(
                height: 20,
              ),
              _buildNameInput(),
              SizedBox(
                height: 20,
              ),
              _buildEmailInput(),
              SizedBox(
                height: 20,
              ),
              _buildPhoneInput(),
              SizedBox(
                height: 20,
              ),
              _buildAddressInput(),
              SizedBox(
                height: 20,
              ),
              _buildDescriptionInput(),
              SizedBox(
                height: 20,
              ),
              _buildPersonalInfo(),
              SizedBox(
                height: 20,
              ),
              _buildSaveButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNameInput() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: _buildFirstNameInput(),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: _buildFamilyNameInput(),
        ),
      ],
    );
  }

  Widget _buildFamilyNameInput() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Family Name',
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildFirstNameInput() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'First Name',
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildEmailInput() {
    return TextField(
      controller: TextEditingController(text: 'tonystaff@sts.com'),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Email',
        enabled: false,
        prefixIcon: Icon(Icons.email),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneInput() {
    return TextField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        hintText: 'Phone Number',
        prefixIcon: Icon(Icons.phone),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildAddressInput() {
    return TextField(
      keyboardType: TextInputType.streetAddress,
      decoration: InputDecoration(
        hintText: 'Address',
        prefixIcon: Icon(Icons.location_on),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildDescriptionInput() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Description',
        prefixIcon: Icon(Icons.mode_comment),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildPersonalInfo() {
    return Row(
      children: [
        Expanded(
          child: _buildBirthdayInput(),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: _buildGenderInput(),
        ),
      ],
    );
  }

  Widget _buildBirthdayInput() {
    return TextField(
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(
        hintText: 'Birthday',
        prefixIcon: Icon(Icons.calendar_today),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildGenderInput() {
    return TextField(
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(
        hintText: 'Gender',
        prefixIcon: Padding(
          padding: const EdgeInsets.all(10.0),
          child: FaIcon(
            FontAwesomeIcons.venusMars,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    return ElevatedButton(
      onPressed: () {
        Get.back();
      },
      child: Text('Save'),
    );
  }
}
