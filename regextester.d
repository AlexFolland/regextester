//regextester.d
import std.stdio, std.regex;
char[] teststring;
char[] regexbuf;

void main()
{
  while(1)
  {
    write("test string: ");
    std.stdio.readln(teststring); teststring.length=teststring.length-1;
    while(teststring.length>0)
    {
      try
      {
        uint i=0;
        write("regex input: ");
        std.stdio.readln(regexbuf); regexbuf.length=regexbuf.length-1;
        if(regexbuf.length>0)
          foreach(m; match(teststring, regex(regexbuf))) 
          {
            i++;
            writefln("Match number %s: %s[%s]%s",i,m.pre,m.hit,m.post);
            if(i >= 50) { writefln("There have been %s matches.  I'm breaking for safety.",i); break; }
          }
      }
      catch(Exception e)
        writeln("That regex doesn't make sense.  The Phobos std.regex library's explanation is:\n",e);
    }
  }
}