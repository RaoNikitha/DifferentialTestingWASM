;; 10. Create a recursive scenario where `br` targets a label in a `loop` inside a `block` that's part of an outer `block`. Ensure each `br` correctly unwinds the stack to the proper height, recursively checking for stack underflows or corrupted states from mismanaged branches.

(assert_invalid
  (module
    (func $recursive-br (result i32)
      (block (result i32)
        (i32.const 1)
        (loop (result i32)
          (block (result i32)
            (br 2) 
            (i32.const 2)
          )
        )
      )
    )
  )
  "type mismatch"
)