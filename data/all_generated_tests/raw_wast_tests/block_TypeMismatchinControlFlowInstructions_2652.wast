;; Test 3: Use a loop block specifying an i32 type and attempt to branch back to the loop start with an f32 value on the stack using the `br` instruction. This checks for correct type enforcement on branches targeting loop blocks.

(assert_invalid
 (module (func $type-loop-branch-mismatch (result i32)
   (loop (result i32)
     (f32.const 1.0)
     (br 0)
   )
 ))
 "type mismatch"
)