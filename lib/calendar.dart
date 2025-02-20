src/components/MealSelector.tsx
import React from 'react';
import { cn } from '@/lib/utils';

type MealOption = 'VEG' | 'NON-VEG' | 'EGG ONLY';

interface MealSelectorProps {
  selectedOption: MealOption;
  onOptionSelect: (option: MealOption) => void;
}

const MealSelector = ({ selectedOption, onOptionSelect }: MealSelectorProps) => {
  const options: { value: MealOption; color: string }[] = [
    { value: 'VEG', color: 'bg-emerald-500' },
    { value: 'NON-VEG', color: 'bg-red-500' },
    { value: 'EGG ONLY', color: 'bg-blue-500' }
  ];

  return (
    <div className="bg-[#F4A460] rounded-3xl p-6 shadow-lg transition-all duration-300 hover:shadow-xl">
      <h2 className="text-[#4A3728] text-2xl font-medium mb-4">Tailor your tiffin :</h2>
      <div className="flex gap-4">
        {options.map(({ value, color }) => (
          <button
            key={value}
            onClick={() => onOptionSelect(value)}
            className={cn(
              "flex items-center gap-2 px-4 py-2 rounded-full transition-all duration-300",
              "text-[#4A3728] hover:opacity-90 focus:outline-none focus:ring-2 focus:ring-offset-2",
              selectedOption === value ? "bg-white/90" : "bg-white/50"
            )}
          >
            <span className={cn("w-3 h-3 rounded-full", color)} />
            {value}
          </button>
        ))}
      </div>
    </div>
  );
};

export default MealSelector;
src/components/DeliveryCalendar.tsx
import React from 'react';
import { Calendar } from '@/components/ui/calendar';
import { ArrowLeft, ArrowRight } from 'lucide-react';
import { cn } from '@/lib/utils';

interface DeliveryCalendarProps {
  selectedDate: Date | undefined;
  onDateSelect: (date: Date | undefined) => void;
}

const DeliveryCalendar = ({ selectedDate, onDateSelect }: DeliveryCalendarProps) => {
  return (
    <div className="bg-[#F4A460] rounded-3xl p-6 shadow-lg transition-all duration-300 hover:shadow-xl">
      <h2 className="text-[#4A3728] text-2xl font-medium mb-4">Choose delivery dates :</h2>
      <div className="bg-white rounded-xl p-4 shadow-sm">
        <Calendar
          mode="single"
          selected={selectedDate}
          onSelect={onDateSelect}
          className="rounded-lg border-none"
          classNames={{
            head_cell: "text-[#4A3728] font-medium",
            cell: cn(
              "h-9 w-9 text-center text-sm p-0 relative [&:has([aria-selected].day-range-end)]:rounded-r-md [&:has([aria-selected].day-outside)]:bg-accent/50 [&:has([aria-selected])]:bg-accent first:[&:has([aria-selected])]:rounded-l-md last:[&:has([aria-selected])]:rounded-r-md focus-within:relative focus-within:z-20",
            ),
            day: cn(
              "h-9 w-9 p-0 font-normal aria-selected:opacity-100",
              "hover:bg-blue-100 rounded-full transition-all",
              "focus:bg-blue-100 focus:ring-2 focus:ring-blue-400 focus:ring-offset-2 focus:outline-none"
            ),
            day_selected: "bg-blue-500 text-white hover:bg-blue-600 hover:text-white focus:bg-blue-600 focus:text-white",
            day_today: "bg-accent text-accent-foreground",
            day_disabled: "text-muted-foreground opacity-50",
            day_range_middle: "aria-selected:bg-accent aria-selected:text-accent-foreground",
            day_hidden: "invisible",
            nav_button: cn(
              "inline-flex items-center justify-center rounded-full p-1",
              "hover:bg-blue-100 transition-colors",
              "focus:bg-blue-100 focus:outline-none focus:ring-2 focus:ring-blue-400 focus:ring-offset-2"
            ),
            nav_button_previous: "absolute left-1",
            nav_button_next: "absolute right-1",
          }}
          components={{
            IconLeft: () => <ArrowLeft className="h-4 w-4 text-[#4A3728]" />,
            IconRight: () => <ArrowRight className="h-4 w-4 text-[#4A3728]" />,
          }}
        />
      </div>
    </div>
  );
};

export default DeliveryCalendar;
src/pages/Index.tsx
import React, { useState } from 'react';
import MealSelector from '@/components/MealSelector';
import DeliveryCalendar from '@/components/DeliveryCalendar';
import { toast } from 'sonner';

type MealOption = 'VEG' | 'NON-VEG' | 'EGG ONLY';

const Index = () => {
  const [selectedMeal, setSelectedMeal] = useState<MealOption>('VEG');
  const [selectedDate, setSelectedDate] = useState<Date>();

  const handleConfirm = () => {
    if (!selectedDate) {
      toast.error('Please select a delivery date');
      return;
    }
    
    toast.success('Order confirmed!', {
      description: ${selectedMeal} meal will be delivered on ${selectedDate.toLocaleDateString()}
    });
  };

  return (
    <div className="min-h-screen bg-[#FDE1D3] p-6 flex flex-col items-center justify-center gap-6">
      <div className="w-full max-w-md space-y-6 animate-fade-in">
        <MealSelector
          selectedOption={selectedMeal}
          onOptionSelect={setSelectedMeal}
        />
        
        <DeliveryCalendar
          selectedDate={selectedDate}
          onDateSelect={setSelectedDate}
        />

        <button
          onClick={handleConfirm}
          className="w-full bg-[#8B4513] text-white rounded-full py-4 px-8 font-medium
                   shadow-lg hover:shadow-xl transition-all duration-300
                   hover:bg-[#733A0F] focus:outline-none focus:ring-2 
                   focus:ring-[#8B4513] focus:ring-offset-2"
        >
          CONFIRM
        </button>
      </div>
    </div>
  );
};

export default Index;
src/index.css
@tailwind base;
@tailwind components;
@tailwind utilities;

@layer base {
  :root {
    --background: 0 0% 100%;
    --foreground: 222.2 84% 4.9%;
    --card: 0 0% 100%;
    --card-foreground: 222.2 84% 4.9%;
    --popover: 0 0% 100%;
    --popover-foreground: 222.2 84% 4.9%;
    --primary: 222.2 47.4% 11.2%;
    --primary-foreground: 210 40% 98%;
    --secondary: 210 40% 96.1%;
    --secondary-foreground: 222.2 47.4% 11.2%;
    --muted: 210 40% 96.1%;
    --muted-foreground: 215.4 16.3% 46.9%;
    --accent: 210 40% 96.1%;
    --accent-foreground: 222.2 47.4% 11.2%;
    --destructive: 0 84.2% 60.2%;
    --destructive-foreground: 210 40% 98%;
    --border: 214.3 31.8% 91.4%;
    --input: 214.3 31.8% 91.4%;
    --ring: 222.2 84% 4.9%;
    --radius: 0.5rem;
  }
}

@layer base {
  * {
    @apply border-border;
  }
  body {
    @apply bg-background text-foreground;
    font-feature-settings: "rlig" 1, "calt" 1;
  }
}

@keyframes fade-in {
  from {
    opacity: 0;
    transform: translateY(10px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.animate-fade-in {
  animation: fade-in 0.5s ease-out forwards;
}
