import React from 'react';
import {useInterpreter} from "./useInterpreter";
import {useCompiler} from "./useCompiler";

const actions = {
  compileError: "compileError",
  compileSuccess: "compileSuccess",
  runSuccess: "runSuccess",
  runFail: "runFail",
}
const PENDING_STATE = "pending";

const reducer = (prevState, action) => {
  if (!action.type) throw Error("Passed no action to useAppStat reducer")

  switch (action.type) {
    case actions.compileError:
      return { state: action.type, screenContent: '', consoleContent: action.payload }
    case actions.compileSuccess:
      return { state: action.type, screenContent: action.payload, consoleContent: '' }
    case actions.runSuccess:
      return { state: action.type, screenContent: prevState.screenContent, consoleContent: action.payload }
    case actions.runFail:
      return { state: action.type, screenContent: prevState.screenContent, consoleContent: action.payload }
  }

  throw Error("Action of given type don't exist for useAppStat reducer");
}

export function useAppStat() {
  const [code, setCode] = React.useState('');
  const [compileOutput, compileError, compileFunction] = useCompiler('');
  const [interpretOutput, runtimeError, interpretFunction] = useInterpreter('');

  const [{ consoleContent, screenContent, state }, dispatch] = React.useReducer(reducer,{ state: PENDING_STATE, consoleContent: '', screenContent: '' });

  const compile = () => compileFunction(code);
  const interpret = () => interpretFunction(compileOutput);
  const isError = (state === actions.runFail) || (state === actions.compileError);

  React.useEffect(() => {
    if (compileError === '') {
      dispatch({ type: actions.compileSuccess, payload: compileOutput });
    } else {
      dispatch({ type: actions.compileError, payload: compileError });
    }
  }, [compileOutput, compileError]);

  React.useEffect(() => {
    if (runtimeError === '') {
      dispatch({ type: actions.runSuccess, payload: interpretOutput });
    } else {
      dispatch({ type: actions.runFail, payload: runtimeError });
    }
  }, [interpretOutput, runtimeError]);

  return { isError, screenContent, consoleContent, code, compile, interpret, setCode };
}