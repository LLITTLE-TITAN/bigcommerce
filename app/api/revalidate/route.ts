import { revalidatePath } from 'next/cache';
import type { NextRequest } from 'next/server';
import { NextResponse } from 'next/server';

export async function GET(request: NextRequest) {
  const secret = request.nextUrl.searchParams.get('secret');
  const path = request.nextUrl.searchParams.get('path');

  if (secret !== process.env.MY_SECRET_TOKEN) {
    return new Response(JSON.stringify({ message: 'Invalid secert-token ' }), {
      status: 401,
    });
  }

  if (path) {
    revalidatePath('/', 'layout');
    revalidatePath(path); // Make sure to implement this function according to your needs.
    return new NextResponse(
      JSON.stringify({ revalidated: true, now: Date.now() }),
    );
  }
  return new NextResponse(JSON.stringify({ message: 'Path is required' }), {
    status: 400,
  });
}
