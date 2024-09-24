;; 3. Construct a WebAssembly function with a mix of `block`, `loop`, and `if` constructs. Utilize a `br` instruction at the end of a `block` to branch to a label within a parent `loop`. Place an `unreachable` instruction after the br and ensure that the control flow correctly unwinds the operand stack without reaching the `unreachable` instruction erroneously.

(assert_invalid
  (module 
    (func $test
      (param i32)
      (result i32)
      (block $outer (result i32)
        (loop $inner (result i32)
          (block $mid (result i32)
            (br 1)
            (unreachable)
          )
          (unreachable)
        )
        (unreachable)
      )
    )
  )
  "unknown label"
)