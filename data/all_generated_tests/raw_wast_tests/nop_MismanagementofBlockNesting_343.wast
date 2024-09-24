;; 4. **Test Nested Loop Blocks with Nop**: Create a WebAssembly function with nested loops and `nop` instructions inside each loop. This checks if the implementations handle nested loops correctly, ensuring loops iterate properly without interruption from `nop`.

(assert_invalid
  (module 
    (func $nested-loops (loop $loop1 (nop) (loop $loop2 (nop)) (br $loop1)))
  )
)