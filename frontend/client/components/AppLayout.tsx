import { Link, Outlet, useLocation } from "react-router-dom";
import { Avatar, AvatarFallback } from "@/components/ui/avatar";
import { Button } from "@/components/ui/button";
import {
  Sidebar,
  SidebarContent,
  SidebarFooter,
  SidebarGroup,
  SidebarGroupContent,
  SidebarGroupLabel,
  SidebarHeader,
  SidebarInset,
  SidebarMenu,
  SidebarMenuButton,
  SidebarMenuItem,
  SidebarProvider,
  SidebarRail,
  SidebarSeparator,
  SidebarTrigger,
} from "@/components/ui/sidebar";
import { cn } from "@/lib/utils";
import { Home, Users, Settings, Crown } from "lucide-react";

export default function AppLayout() {
  const location = useLocation();
  const isActive = (path: string) => location.pathname === path;

  return (
    <SidebarProvider>
      <Sidebar collapsible="icon" variant="inset">
        <SidebarHeader>
          <div className="flex items-center gap-2 px-2 py-1">
            <div className="inline-flex h-8 w-8 items-center justify-center rounded-md bg-primary text-primary-foreground shadow-soft">
              <Crown className="h-4 w-4" />
            </div>
            <span className="font-semibold tracking-tight">Nova Admin</span>
          </div>
        </SidebarHeader>
        <SidebarSeparator />
        <SidebarContent>
          <SidebarGroup>
            <SidebarGroupLabel className="text-[11px] uppercase tracking-wider text-muted-foreground">
              Navigation
            </SidebarGroupLabel>
            <SidebarGroupContent>
              <SidebarMenu>
                <SidebarMenuItem>
                  <SidebarMenuButton asChild isActive={isActive("/")}> 
                    <Link to="/" className="flex items-center gap-2">
                      <Home className="h-4 w-4" />
                      <span>Dashboard</span>
                    </Link>
                  </SidebarMenuButton>
                </SidebarMenuItem>
                <SidebarMenuItem>
                  <SidebarMenuButton asChild isActive={isActive("/users")}>
                    <Link to="/users" className="flex items-center gap-2">
                      <Users className="h-4 w-4" />
                      <span>Users</span>
                    </Link>
                  </SidebarMenuButton>
                </SidebarMenuItem>
                <SidebarMenuItem>
                  <SidebarMenuButton asChild isActive={isActive("/settings")}>
                    <Link to="/settings" className="flex items-center gap-2">
                      <Settings className="h-4 w-4" />
                      <span>Settings</span>
                    </Link>
                  </SidebarMenuButton>
                </SidebarMenuItem>
              </SidebarMenu>
            </SidebarGroupContent>
          </SidebarGroup>
        </SidebarContent>
        <SidebarFooter className="text-xs text-muted-foreground">
          <div className="px-2">© {new Date().getFullYear()} Nova</div>
        </SidebarFooter>
        <SidebarRail />
      </Sidebar>
      <SidebarInset>
        <header className="sticky top-0 z-20 border-b bg-background/80 backdrop-blur supports-[backdrop-filter]:bg-background/60">
          <div className="flex h-14 items-center gap-3 px-4">
            <SidebarTrigger />
            <div className="ml-2 text-sm text-muted-foreground">Admin Dashboard</div>
            <div className="ml-auto flex items-center gap-3">
              <Button variant="outline" size="sm" className="hidden sm:inline-flex">New</Button>
              <Avatar className="h-8 w-8 ring-2 ring-muted/40">
                <AvatarFallback>BD</AvatarFallback>
              </Avatar>
            </div>
          </div>
        </header>
        <div className={cn("p-6")}>
          <Outlet />
        </div>
      </SidebarInset>
    </SidebarProvider>
  );
}
