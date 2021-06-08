import {classes} from "istanbul-lib-coverage";
import SyntaxHighlighter from "react-syntax-highlighter";
import Paper from "@material-ui/core/Paper";
import React from "react";
import withStyles from "@material-ui/core/styles/withStyles";

const StyledPaper = withStyles({
  root: {
    height: "calc(100% - 32px)",
    margin: "16px",
    overflowY: "scroll",
    overflowX: "hidden",
    background: "rgb(240, 240, 240)",
  },
})(Paper);

const divStyles = {
  marginTop: "-1em",
  marginBottom: "-1em",
}

export function Display ({value}) {
  return (
    <StyledPaper className={classes.paper}>
      <div style={divStyles}>
        <SyntaxHighlighter language="javascript">
              {value}
        </SyntaxHighlighter>
      </div>
    </StyledPaper>
  );
}