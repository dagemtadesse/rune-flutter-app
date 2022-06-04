import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rune/application/blocs.dart';
import 'package:rune/domain/channel/channel_validator.dart';
import 'package:rune/theme.dart';
import 'dart:developer' as developer;

class CreateChannelPage extends StatelessWidget {
  CreateChannelPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final emailController = TextEditingController();
  final locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    context.read<ChannelBloc>().add(ChanneIdle());
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: const AssetImage("assets/channel.png"),
                    radius: 50.0,
                    child: IconButton(
                      iconSize: 40.84,
                      icon: const Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(
                    width: 38,
                  ),
                  const Text(
                    "Channel Icon",
                    style: TextStyle(fontFamily: "Poppins", fontSize: 16),
                  )
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              TextFormField(
                controller: nameController,
                validator: ChannelValidator.validateChannelName,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Channel name',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: descriptionController,
                validator: ChannelValidator.validateChannelName,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'description',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: emailController,
                validator: ChannelValidator.validateEmail,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'E-mail address',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: locationController,
                validator: ChannelValidator.validateLocation,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Location',
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              BlocConsumer<ChannelBloc, ChannelState>(
                listener: (context, state) {
                  developer.log("$state");
                  if (state is ChannelCreated) {
                    context
                        .read<NavigationCubit>()
                        .toChannelScreen(state.channel);
                  }

                  if (state is ChannelCreationFailed) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(state.errMsg)));
                  }
                },
                builder: (context, state) {
                  return Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: double.infinity,
                        child: TextButton(
                            style: SplashTheme.buttonTheme,
                            child: !(state is ChannelCreating)
                                ? Text("Create Channel",
                                    style: SplashTheme.textTheme.labelMedium)
                                : const SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<ChannelBloc>().add(CreateChannel(
                                    nameController.text,
                                    descriptionController.text,
                                    emailController.text,
                                    locationController.text));
                              }
                            }
                            // : null,
                            ),
                      ),
                    ],
                  ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
