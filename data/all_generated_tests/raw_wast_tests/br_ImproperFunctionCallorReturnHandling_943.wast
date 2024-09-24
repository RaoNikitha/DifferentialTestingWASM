;; 4. Use `block` and `loop` combinations where `call` and `br` instructions are mixed. Ensure that `br` targets the outer block, thus potentially jumping out of an ongoing function call sequence and improper unwinding steps of previous function calls.

(assert_invalid
  (module
    (func $complex-test
      (block $outer
        (loop $inner
          (call $someFunc)
          (br $outer)
        )
      )
    )
    (func $someFunc (nop))
  )
  "invalid branch target"
)