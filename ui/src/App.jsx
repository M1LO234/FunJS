import React from 'react';
import AppBar from "@material-ui/core/AppBar";
import {classes} from "istanbul-lib-coverage";
import Grid from "@material-ui/core/Grid";
import Typography from "@material-ui/core/Typography";
import Paper from "@material-ui/core/Paper";
import TextField from "@material-ui/core/TextField";
import SyntaxHighlighter from "react-syntax-highlighter";
import Fab from "@material-ui/core/Fab";
import ArrowRightAltIcon from '@material-ui/icons/ArrowRightAlt';
import {useGrammar} from "./useGrammar";

const SPACE = 16;

function App() {
  const [output, error, compile] = useGrammar();
  const [code, setCode] = React.useState('');


  return (
    <Grid style={{ height: "100vh" }} spacing={0} container direction="column">
      <Grid xs={1} style={{ maxWidth: "100vw" }} container item>
        <AppBar item position="static" style={{padding: "10px"}}>
          <Typography variant="h4" className={classes.title}>
            FunJS
          </Typography>
        </AppBar>
      </Grid>
      <Grid xs={9} style={{ maxWidth: "100vw", overflow: "hidden" }} container item alignItems="stretch">
        <Grid item xs={6}>
          <Paper className={classes.paper} style={{ margin: `${SPACE}px` }}>
            <TextField multiline label="Code" variant="outlined" style={{ width: "100%" }} rows={38} onChange={(e) => setCode(e.target.value)} />
          </Paper>
        </Grid>
        <Grid item xs={6}>
          <Paper className={classes.paper} style={{ margin: `${SPACE}px`, height: "75vh", overflow: "scroll" }}>
            <SyntaxHighlighter language="javascript">
              {output}
            </SyntaxHighlighter>
          </Paper>
        </Grid>
      </Grid>
      <Grid item xs={2} style={{ maxWidth: "100vw" }} alignItems="stretch">
        <Paper item className={classes.paper} style={{ margin: `${SPACE}px` }}>
          <TextField multiline error={error} disabled={true} label="Console" variant="outlined" style={{ width: "100%" }} rows={5} value={error} />
        </Paper>
      </Grid>
      <Fab style={{ position: "absolute", left: "50%", top: "50%", transform: "translate(-50%, -50%)" }} color="primary" aria-label="compile"
        onClick={() => compile(code)}>
        <ArrowRightAltIcon />
      </Fab>
    </Grid>
  );
}

export default App;
