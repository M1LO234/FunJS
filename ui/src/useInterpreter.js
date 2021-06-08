import React from 'react';

const constructConsoleMock = () => {
  let result = "";
  return {
    log: (...content) => (content.forEach(el => result += `${el}\n`), void 0),
    getLogs: () => result,
  }
}

export function useInterpreter () {
  const [input, setInput] = React.useState('');
  const [error, setError] = React.useState('')
  const [output, setOutput] = React.useState('');

  React.useEffect(() => {
    const consoleCopy = console;
    try {
      console = constructConsoleMock();
      eval(input);
      setOutput(console.getLogs());
      setError('');
    } catch (error) {
      setOutput('');
      setError(error);
    } finally {
      console = consoleCopy;
    }
  }, [input])

  return [output, error, setInput];
}