import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/i18n/failure_i18n_extensions.dart';
import '../../../shared/ui/widgets/loading_text_button.dart';
import '../state/mutate_answer_function_form_state.dart';

class MutateAnswerFunctionForm extends StatelessWidget {
  const MutateAnswerFunctionForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MutateAnswerFunctionFormCubit, MutateAnswerFunctionFormState>(
      builder: (_, state) {
        return Form(
          autovalidateMode: state.validateForm ? AutovalidateMode.always : AutovalidateMode.disabled,
          child: ListView(
            children: [
              TextFormField(
                controller: context.mutateAnswerFunctionFormCubit.funcFieldController,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(hintText: 'Func'),
                onChanged: context.mutateAnswerFunctionFormCubit.onFuncChanged,
                validator: (_) => context.mutateAnswerFunctionFormCubit.state.func.translateFailure(),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: context.mutateAnswerFunctionFormCubit.conditionFieldController,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(hintText: 'Condition'),
                onChanged: context.mutateAnswerFunctionFormCubit.onConditionChanged,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: context.mutateAnswerFunctionFormCubit.weightFieldController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: 'Weight'),
                onChanged: context.mutateAnswerFunctionFormCubit.onWeightChanged,
                validator: (_) => context.mutateAnswerFunctionFormCubit.state.weight.translateFailure(),
              ),
              const SizedBox(height: 20),
              LoadingTextButton(
                onPressed: context.mutateAnswerFunctionFormCubit.onSubmit,
                isLoading: state.isSubmitting,
                label: 'Submit',
              ),
            ],
          ),
        );
      },
    );
  }
}