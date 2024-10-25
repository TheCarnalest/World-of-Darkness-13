import { useBackend } from "../backend";
import { Box, Button, Section, TextInput, NoticeBox, NumberInput } from "../components";
import { Window } from "../layouts";

export const ATM = (props, context) => {
  const { act, data } = useBackend(context);
  const { atmBalance, cardBalance } = data;

  return (
    <Window title="Bianchi Bank ATM" width={400} height={300}>
      <Window.Content>
        <Section title="ATM Balance">
          <NoticeBox>
            ATM currently holds: ${atmBalance}
          </NoticeBox>
        </Section>
        <Section title="Card Balance">
          <NoticeBox>
            Your card balance: ${cardBalance}
          </NoticeBox>
        </Section>
        <Section title="Actions">
          <Button text="Withdraw Money" onClick={() => act("withdraw")} />
          <Button text="Deposit Money" onClick={() => act("deposit")} />
          <Button text="Exit" onClick={() => act("exit")} />
        </Section>
      </Window.Content>
    </Window>
  );
};
