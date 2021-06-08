import Fab from "@material-ui/core/Fab";
import ArrowRightAltIcon from "@material-ui/icons/ArrowRightAlt";
import PlayArrowIcon from "@material-ui/icons/PlayArrow";
import React from "react";

export function CompileButton(props) {
  return (
    <Fab style={{ position: "absolute", left: "50%", top: "50%", transform: "translate(-50%, -50%)" }}
         color="primary" aria-label="compile" {...props}>
      <ArrowRightAltIcon />
    </Fab>
  );
}

export function RunButton(props) {
  return (
    <Fab style={{ position: "absolute", left: "100%", top: "0%", transform: "translate(-100%, 0%)" }}
         color="primary" aria-label="run" {...props}>
      <PlayArrowIcon />
    </Fab>
  );
}
