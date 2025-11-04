import { Card, CardContent } from "@/components/ui/card";
import { cn } from "@/lib/utils";
import { ReactNode } from "react";

interface DashboardCardProps {
  title: string;
  value: string | number;
  icon?: ReactNode;
  className?: string;
  subtext?: string;
}

export function DashboardCard({ title, value, icon, className, subtext }: DashboardCardProps) {
  return (
    <Card className={cn("shadow-soft", className)}>
      <CardContent className="p-5">
        <div className="flex items-start justify-between">
          <div>
            <div className="text-xs font-medium uppercase tracking-wide text-muted-foreground">{title}</div>
            <div className="mt-2 text-2xl font-semibold tracking-tight">{value}</div>
            {subtext ? (
              <div className="mt-1 text-xs text-muted-foreground">{subtext}</div>
            ) : null}
          </div>
          {icon ? (
            <div className="inline-flex h-9 w-9 items-center justify-center rounded-md bg-secondary text-secondary-foreground">
              {icon}
            </div>
          ) : null}
        </div>
      </CardContent>
    </Card>
  );
}
