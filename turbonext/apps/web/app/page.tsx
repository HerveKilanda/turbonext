import { UserButton } from "@clerk/nextjs";
import { Button } from "./components/ui/button";
export default function Home() {
  return (
    <div>
      <h1>Bienvenue sur turbonext </h1>
      <Button>Hello</Button>
      <UserButton/>
    </div>
  );
}