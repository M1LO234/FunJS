import React from 'react';
import {TextArea} from "./components/TextArea/TextArea";
import {useAppStat} from "./useAppState";
import {FullHeight, GlobalContainer, Row} from "./components/Grids/Containers";
import {Header} from "./components/Header/Header";
import {CompileButton, RunButton} from "./components/Buttons/Buttons";
import {Display} from "./components/Display/Display";

function App() {
  const { isError, screenContent, consoleContent, code, compile, interpret, setCode } = useAppStat()

  const onChange = (e) => setCode(e.target.value);
  const consoleLabel = consoleContent === '' ? "Console" : (isError ? "Error" : "Output");

  return (
    <GlobalContainer>
      <Row xs={1}>
        <Header />
      </Row>
      <Row xs={9}>
        <FullHeight xs={6}>
          <TextArea label="Code" onChange={onChange} value={code} />
        </FullHeight>
        <FullHeight xs={6}>
          <Display value={screenContent} />
        </FullHeight>
        <CompileButton onClick={compile} />
        {screenContent && <RunButton onClick={interpret} /> }
      </Row>
      <Row xs={2}>
        <TextArea disabled={true} label={consoleLabel} error={isError} value={consoleContent} />
      </Row>
    </GlobalContainer>
  );
}

export default App;
