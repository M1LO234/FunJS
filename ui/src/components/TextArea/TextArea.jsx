import TextField from "@material-ui/core/TextField";
import React from "react";
import withStyles from "@material-ui/core/styles/withStyles";

const StyledTextField = withStyles({
  root: {
    height: "calc(100% - 32px)",
    width: "calc(100% - 32px)",
    margin: "16px",
    '& label.MuiFormLabel-filled': {
      padding: "2px",
    },
    '& label.Mui-focused': {
      padding: "2px",
    },
    '& label': {
      backgroundColor: "white",
    },
    '& div': {
      alignItems: "start",
      height: "100%",
      overflow: "auto",
      border: "1px solid black",
      '& textarea': {
        paddingBottom: "18.5px",
      },
      '& fieldset': {
        border: "none",
      }
    },
    '& div.Mui-focused': {
      border: "1px solid #3f51b5",
    }
  },
})(TextField);

export function TextArea(props) {
  return <StyledTextField multiline variant="outlined" {...props} />;
}
