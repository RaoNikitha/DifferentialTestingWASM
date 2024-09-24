;; - Test Description 4: Consider a WebAssembly function that uses a sequence of `block`, `loop`, and `if` statements, interspersed with `nop` instructions. Test if the `nop` instructions disrupt the resolution of `br` targets, causing the control to jump to inappropriate blocks or loops.

(assert_invalid
  (module
    (func $br-targets 
      (block 
        (loop 
          (if (i32.const 0)
            (then (nop) (br 1))
          )
          (nop)
        )
        (br 0)
      )
      (nop)
    )
  )
  "invalid branch target"
)