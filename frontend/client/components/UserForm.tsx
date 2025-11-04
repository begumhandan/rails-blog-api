import { useForm } from "react-hook-form";
import { z } from "zod";
import { zodResolver } from "@hookform/resolvers/zod";
import { Card, CardContent } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";

const UserSchema = z.object({
  name: z.string().min(1, "Name is required"),
  email: z.string().email("Enter a valid email"),
});

export type NewUser = z.infer<typeof UserSchema>;

interface UserFormProps {
  onAdd: (user: NewUser) => void;
}

export function UserForm({ onAdd }: UserFormProps) {
  const {
    register,
    handleSubmit,
    reset,
    formState: { errors, isSubmitting },
  } = useForm<NewUser>({ resolver: zodResolver(UserSchema) });

  const onSubmit = (data: NewUser) => {
    onAdd(data);
    reset();
  };

  return (
    <Card className="shadow-soft">
      <CardContent className="p-5">
        <form className="grid gap-4 md:grid-cols-3" onSubmit={handleSubmit(onSubmit)}>
          <div className="grid gap-2">
            <Label htmlFor="name">Name</Label>
            <Input id="name" placeholder="Jane Doe" {...register("name")} />
            {errors.name && (
              <p className="text-xs text-destructive">{errors.name.message}</p>
            )}
          </div>
          <div className="grid gap-2">
            <Label htmlFor="email">Email</Label>
            <Input id="email" type="email" placeholder="jane@company.com" {...register("email")} />
            {errors.email && (
              <p className="text-xs text-destructive">{errors.email.message}</p>
            )}
          </div>
          <div className="flex items-end">
            <Button type="submit" className="w-full md:w-auto" disabled={isSubmitting}>
              Register User
            </Button>
          </div>
        </form>
      </CardContent>
    </Card>
  );
}
