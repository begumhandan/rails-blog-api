import { Card, CardContent, CardTitle } from "@/components/ui/card";

export default function Settings() {
  return (
    <div className="space-y-6">
      <Card className="shadow-soft">
        <CardContent className="p-6">
          <CardTitle className="text-xl">Settings</CardTitle>
          <p className="mt-2 text-muted-foreground">
            This page is a placeholder. Continue prompting to configure app settings and preferences here.
          </p>
        </CardContent>
      </Card>
    </div>
  );
}
