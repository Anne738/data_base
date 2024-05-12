export interface Dinosaur {
  _id?: string;
  name: string;
  type: string;
  age: number;
}

export type ModeType = 'read' | 'update' | 'create' | 'delete';
