package ppt;

import java.util.Arrays;

public class Sorting {

    public static void insertSort(int[] A) {

        for (int i = 1; i < A.length; i++) {

            int temp = A[i];
            int j = i;
            for (; j >= 1 && temp < A[j - 1]; j--) {
                A[j] = A[j - 1];
            }
            A[j] = temp;

        }

    }

    public static void insertionSort(Comparable[] A) {

        for (int i = 1; i < A.length; i++) {
            Comparable temp = A[i];
            int j = i;
            for (; j > 0; j--) {
                if (temp.compareTo(A[j - 1]) < 0)
                    A[j] = A[j - 1];
                else break;
            }
            A[j] = temp;
        }


    }

    public static void binaryInsertSort(int[] a) {

        for (int i = 1; i < a.length; i++) {

            int temp = a[i];

            int low = 0;
            int high = i - 1;
            while (low <= high) {

                int mid = (low + high) / 2;

                if (temp < a[mid]) {
                    high = mid - 1;
                } else {
                    low = mid + 1;
                }

            }
            int j;
            for (j = i; j > low; j--) {
                a[j] = a[j - 1];
            }
            a[j] = temp;

        }

    }

    public static int binarySearch(int[] A, int x) {


        int low = 0;
        int high = A.length - 1;

        while (low <= high) {

            int mid = (low + high) / 2;

            if (A[mid] == x)
                return mid;
            else if (x < A[mid])
                high = mid - 1;
            else
                high = mid + 1;


        }

        return -1;

    }

    public static void quickSort(int[] A, int low, int high) {

        if (low >= high) return;

        int i = low;
        int j = high;

        int pivot = A[low];

        while (i != j) {

            while (i < j && A[j] >= pivot)
                j--;
            if (i < j)
                A[i] = A[j];

            while (i < j && A[i] <= pivot)
                i++;
            if (i < j)
                A[j] = A[i];

        }

        A[i] = pivot;

        quickSort(A, low, i - 1);
        quickSort(A, i + 1, high);


    }


    public static void bubbleSort(int[] A) {

        for (int i = A.length - 1; i > 0; i--) {
            for (int j = 0; j <= i - 1; j++) {
                if (A[j] > A[j + 1]) {
                    int temp = A[j];
                    A[j] = A[j + 1];
                    A[j + 1] = temp;
                }
            }
        }

    }

    public static void shellSort(int[] A) {

        for (int gap = A.length / 2; gap > 0; gap /= 2) {

            for (int i = gap; i < A.length; i++) {

                int temp = A[i];
                int j;
                for (j = i; j >= gap && temp < A[j - gap]; j -= gap) {
                    A[j] = A[j - gap];
                }
                A[j] = temp;

            }

        }

    }

    public static void mergeSort(Comparable[] A, int low, int high) {

        if (low >= high) return;

        int mid = (low + high) / 2;
        mergeSort(A, low, mid);
        mergeSort(A, mid + 1, high);
        merge(A, low, mid, high);

    }

    public static void merge(Comparable[] A, int l, int m, int n) {

        Comparable[] tempA = new Comparable[A.length];

        int i = l;
        int j = m + 1;
        int k = l;

        while (i <= m && j <= n) {
            if (A[j].compareTo(A[i]) < 0)
                tempA[k++] = A[j++];
            else
                tempA[k++] = A[i++];

        }

        while (i <= m)
            tempA[k++] = A[i++];

        while (j <= n)
            tempA[k++] = A[j++];


        for (int p = l; p <= n; p++) {
            A[p] = tempA[p];
        }

    }

    public static void selectSort(int[] A) {

        for (int i = 0; i < A.length; i++) {
            int k = i;
            for (int j = k + 1; j < A.length; j++) {
                if (A[j] < A[k])
                    k = j;
            }
            int temp = A[i];
            A[i] = A[k];
            A[k] = temp;
        }

    }

    public static void percDown(Comparable[] A, int i, int size) {

        Comparable temp = A[i];
        int ci = 2 * i;
        while (ci <= size) {
            if (ci < size && A[ci + 1].compareTo(A[ci]) < 0) ci++;
            if (A[ci].compareTo(temp) < 0) {
                A[i] = A[ci];
                i = ci;
                ci *= 2;
            } else {
                break;
            }
        }

        A[i] = temp;
    }

    public static void heapSort(Comparable[] A) {

        int size = A.length - 1;
        for (int i = size / 2; i >= 1; i--) {
            percDown(A, i, size);
        }

        for (int i = size; i > 1; i--) {

            Comparable temp = A[1];
            A[1] = A[i];
            A[i] = temp;
            percDown(A, 1, i - 1);

        }

    }

    public static void main(String[] args) {
//        int[] num = {8, 2, 6, 12, 1, 9, 5, 5, 10};
//        Integer[] num={0,21,25,49,25,16,8};
        Integer[] num = {0, 8, 2, 6, 12, 1, 9, 5, 5, 10};
        insertionSort(num);
        System.out.println(Arrays.toString(num));
    }


}
