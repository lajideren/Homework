public class QuickSort {


    private static void quickSort(int[] nums,int left,int right){

//        int pivot=median3(nums, left, right);
        int i=left;
        int j=right;
        if(left>=right)
            return;

        int temp=nums[left];

        //left+1的位置初始是一个空位
        //小的数向左移，大的向右边移，知道指针到达空位仍未找到可以移动的数（i=j时）把pivot放入
        while(i!=j) {

            while (i < j && nums[j] >= temp)
                j--;
            if (i < j)
                nums[i] = nums[j];

            while (i < j && nums[i] <= temp)
                i++;
            if (i < j)
                nums[j] = nums[i];

        }

        nums[i]=temp;

        quickSort(nums,left,i-1);
        quickSort(nums,i+1,right);


    }

    public static void main(String[] args) {

        int[] nums={8,2,6,12,1,9,5,5,10};
        quickSort(nums,0,nums.length-1);

        for(int i=0;i<nums.length;i++)
            System.out.print(nums[i]+" ");

    }


    //选出三数中值并换到left+1的位置上
//    private static int median3(int[] nums,int left,int right){
//
//        int mid=(left+right)/2;
//
//        //对这个三个数冒泡排序
//        if(nums[right]<nums[mid])
//            swapReferences(nums,right,mid);
//        if(nums[mid]<nums[left])
//            swapReferences(nums,mid,left);
//        if(nums[right]<nums[mid])
//            swapReferences(nums,right,mid);
//
//        swapReferences(nums,left+1,mid);
//        return nums[left+1];
//
//    }

    //数组中两个数交换位置
//    private static void swapReferences(int[] nums,int left,int right){
//
//        int temp=nums[left];
//        nums[left]=nums[right];
//        nums[right]=temp;
//
//    }
}
