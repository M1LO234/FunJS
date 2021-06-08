import React from 'react';
import escodegen from 'escodegen';
import parser from './grammar.js';

const createErrorMessage = (error) => {
  return `${error.message}
Location: line ${error.location.start.line}, column ${error.location.start.column}.`
}

export function useGrammar () {
  const [input, setInput] = React.useState('');
  const [error, setError] = React.useState('')
  const [code, setCode] = React.useState('');

  React.useEffect(() => {
    try {
      const ast = parser.parse(input);
      const output = escodegen.generate(ast);
      setError('');
      setCode(output)
    } catch (error) {
      setError(createErrorMessage(error));
      setCode('');
    }
  }, [input])

  return [code, error, setInput];
}