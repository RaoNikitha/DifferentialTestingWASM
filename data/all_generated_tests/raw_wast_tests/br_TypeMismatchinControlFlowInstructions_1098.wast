;; 9. A block with mixed type expectations where different branches (including ones with `br` instructions) lead to different types being on the stack, such as `i32` in one path and `f32` in another.

(assert_invalid
 (module (func $mixed-type-branch
   (block (result f32)
     (block (br 1 (i32.const 0)))
     (f32.const 0.0)
   )
 ))
 "type mismatch"
)