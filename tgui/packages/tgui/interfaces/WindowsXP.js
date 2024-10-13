import { Window } from "../layouts";
import { WinXP } from "./WindowsXP/index";
import { useBackend } from "../backend";
import { Component } from 'inferno';

const WindowsXP = () => {
  const { act, data } = useBackend();
  return (
    <Window width={1200} height={678} theme="light">
      <WinXP data={data} act={act} />
    </Window>
  );
};
