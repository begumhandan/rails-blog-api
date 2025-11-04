import { useState } from "react";
import { DashboardCard } from "@/components/DashboardCard";
import { UserForm, NewUser } from "@/components/UserForm";
import { UserTable, UserRow } from "@/components/UserTable";
import { Users, Activity, DollarSign } from "lucide-react";

export default function Index() {
  const [users, setUsers] = useState<UserRow[]>([
    { name: "Alex Johnson", email: "alex@nova.io", role: "Admin", status: "Active" },
    { name: "Priya Patel", email: "priya@nova.io", role: "Manager", status: "Invited" },
    { name: "Diego Rivera", email: "diego@nova.io", role: "Member", status: "Active" },
    { name: "Liu Wei", email: "liu@nova.io", role: "Member", status: "Suspended" },
  ]);

  const handleAddUser = (user: NewUser) => {
    const newRow: UserRow = { name: user.name, email: user.email, role: "Member", status: "Active" };
    setUsers((prev) => [newRow, ...prev]);
  };

  return (
    <div className="space-y-6">
      <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
        <DashboardCard title="Total Users" value={users.length} icon={<Users className="h-4 w-4" />} subtext="All registered accounts" />
        <DashboardCard title="Active Sessions" value={182} icon={<Activity className="h-4 w-4" />} subtext="In the last 24h" />
        <DashboardCard title="Revenue" value={"$24,500"} icon={<DollarSign className="h-4 w-4" />} subtext="MTD" />
      </div>

      <div className="grid gap-6 lg:grid-cols-3">
        <div className="lg:col-span-1">
          <UserForm onAdd={handleAddUser} />
        </div>
        <div className="lg:col-span-2">
          <UserTable users={users} />
        </div>
      </div>
    </div>
  );
}
