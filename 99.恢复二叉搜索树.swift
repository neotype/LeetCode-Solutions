/*
 * @lc app=leetcode.cn id=99 lang=swift
 *
 * [99] 恢复二叉搜索树
 */

// @lc code=start
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {

    private var first: TreeNode?
    private var second: TreeNode?
    private var pre: TreeNode?


    func recoverTree(_ root: TreeNode?) {
        guard root != nil else {
            return
        }

        recoverInorderHelper(root)

        if first != nil && second != nil {
            swap(&first!.val, &second!.val)
        }
    }

    func recoverInorderHelper(_ node: TreeNode?) {
        guard node != nil else {
            return 
        }
        recoverInorderHelper(node!.left)

        if pre == nil {
            pre = node
        } else {
            if (node!.val < pre!.val) {
                if first == nil {
                    first = pre
                }
                second = node
            }
            pre = node
        }
    
        recoverInorderHelper(node!.right)
    }
}
// @lc code=end

 