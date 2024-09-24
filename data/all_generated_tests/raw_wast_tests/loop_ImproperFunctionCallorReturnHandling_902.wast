;; - Create a `loop` that conditionally executes a `call` instruction and returns a value. Validate the proper unwinding and reinitialization of the loop when the function signature mismatches.

(assert_invalid
  (module 
    (type $t (func (param i32) (result i32)))
    (func $f (param i32) (result i32) (i32.const 1))
    (func (result i32) 
      (loop (param i32) (call $f) (br 1))
    ))
  "type mismatch"
)