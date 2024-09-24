;; 4. Embed `nop` instructions among `get_local` and `set_local` instructions to make sure the `nop` instructions do not disrupt the local variable stack handling and local variable assignments are maintained correctly.

(assert_invalid
  (module
    (func $test-nop-local
      (local $x i32)
      (local $y i32)
      (get_local $x)
      (nop)
      (set_local $y)
      (nop)
      (get_local $y)
      (nop)
    )
  )
  "unexpected token"
)