vim.cmd([[
    function! InferAlternateFilename()
      let currentFile=expand("%:p")
      let newFile = getcwd()
      let baseFilename = matchstr(currentFile, "[^/]*$")
      if currentFile =~ "_test.rb"
        let newFile = newFile .. "/*/" .. substitute(baseFilename, "_test.rb", ".rb", "")
      else
        let newFile = newFile .. "/*/" .. substitute(baseFilename, ".rb", "_test.rb", "")
        
      endif
      return newFile
    endfunction

    function! CommitFileAndTestFile()
      let currentFile=expand("%:p")
      let alternate=InferAlternateFilename()
      echo system("git add " .. currentFile)
      echo system("git add " .. alternate)

      let command = "git commit -m '[WIP][Green] Got to green!'" 
      let previousCommitMessage = system("git show HEAD --pretty=%s -s")

      if match(previousCommitMessage, "WIP\]\[Green") >= 0
        let previousCommitHash = system("git show HEAD --pretty=%h -s")
        let command = command .. " --fixup " .. previousCommitHash
      endif

      echo "> " .. command

      echo system(command)
    endfunction
]])
