;; 8. **Test 8**: Use `nop` within a function containing nested loops that make `call` instructions. Check for any incorrect loop continuation or premature returns caused by the presence of `nop`.

(assert_invalid
  (module
    (func $nested-loops (result i32)
      (nop)
      (block 
        (loop $loop1
          (call $type-i32)
          (nop)
          (loop $loop2
            (call $type-i32)
            (br $loop1)
          )
        )
      )
    )
    (func $type-i32 (result i32) (i32.const 42))
  )
  "type mismatch"
)