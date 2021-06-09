import Grid from "@material-ui/core/Grid";
import React from "react";

export function GlobalContainer({children}) {
  return <Grid style={{ height: "100vh" }} spacing={0} container direction="column">{children}</Grid>
}

export function Row({children, xs}) {
  return <Grid xs={xs} style={{ maxWidth: "100vw", overflow: "hidden", position: "relative" }} container item alignItems="stretch">{children}</Grid>
}

export function FullHeight({children, xs}) {
  return <Grid style={{ height: "100%" }} item xs={xs}>{children}</Grid>
}
