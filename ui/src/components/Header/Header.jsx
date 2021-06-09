import Typography from "@material-ui/core/Typography";
import {classes} from "istanbul-lib-coverage";
import AppBar from "@material-ui/core/AppBar";
import React from "react";

export function Header({ title = 'FunJS' } = {}) {
  return (
    <AppBar position="static" style={{padding: "10px"}}>
      <Typography variant="h3" className={classes.title}>
        {title}
      </Typography>
    </AppBar>
  );
}